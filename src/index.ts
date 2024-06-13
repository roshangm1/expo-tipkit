import {
  NativeModulesProxy,
  EventEmitter,
  Subscription,
} from "expo-modules-core";

// Import the native module. On web, it will be resolved to ExpoTipkit.web.ts
// and on native platforms to ExpoTipkit.ts
import ExpoTipkitModule from "./ExpoTipkitModule";
import ExpoTipkitView from "./ExpoTipkitView";
import { ChangeEventPayload, ExpoTipkitViewProps } from "./ExpoTipkit.types";
import { ViewProps } from "react-native";

export interface TipProps extends ViewProps {
  children?: any;
}

const emitter = new EventEmitter(
  ExpoTipkitModule ?? NativeModulesProxy.ExpoTipkit
);

export function displayTip(tipId: string, tag: number): void {
  console.log("displayTip", tipId, tag);
  ExpoTipkitModule.displayTip(tipId, tag);
}

export function addChangeListener(
  listener: (event: ChangeEventPayload) => void
): Subscription {
  return emitter.addListener<ChangeEventPayload>("onChange", listener);
}

export { ExpoTipkitView, ExpoTipkitViewProps, ChangeEventPayload };
