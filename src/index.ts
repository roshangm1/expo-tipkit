import { NativeModulesProxy, EventEmitter, Subscription } from 'expo-modules-core';

// Import the native module. On web, it will be resolved to ExpoTipkit.web.ts
// and on native platforms to ExpoTipkit.ts
import ExpoTipkitModule from './ExpoTipkitModule';
import ExpoTipkitView from './ExpoTipkitView';
import { ChangeEventPayload, ExpoTipkitViewProps } from './ExpoTipkit.types';

// Get the native constant value.
export const PI = ExpoTipkitModule.PI;

export function hello(): string {
  return ExpoTipkitModule.hello();
}

export async function setValueAsync(value: string) {
  return await ExpoTipkitModule.setValueAsync(value);
}

const emitter = new EventEmitter(ExpoTipkitModule ?? NativeModulesProxy.ExpoTipkit);

export function addChangeListener(listener: (event: ChangeEventPayload) => void): Subscription {
  return emitter.addListener<ChangeEventPayload>('onChange', listener);
}

export { ExpoTipkitView, ExpoTipkitViewProps, ChangeEventPayload };
