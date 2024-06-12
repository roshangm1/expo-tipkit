import * as React from 'react';

import { ExpoTipkitViewProps } from './ExpoTipkit.types';

export default function ExpoTipkitView(props: ExpoTipkitViewProps) {
  return (
    <div>
      <span>{props.name}</span>
    </div>
  );
}
