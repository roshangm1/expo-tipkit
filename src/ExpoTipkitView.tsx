import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

import { ExpoTipkitViewProps } from './ExpoTipkit.types';

const NativeView: React.ComponentType<ExpoTipkitViewProps> =
  requireNativeViewManager('ExpoTipkit');

export default function ExpoTipkitView(props: ExpoTipkitViewProps) {
  return <NativeView {...props} />;
}
