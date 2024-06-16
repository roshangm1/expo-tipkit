import { ViewProps } from "react-native";

export type ChangeEventPayload = {
  value: string;
};

export interface ExpoTipkitViewProps extends ViewProps {
  title: string;
  id: string;
  show: boolean;
}
