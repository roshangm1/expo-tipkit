import { Button, SafeAreaView, StyleSheet, Text, View } from "react-native";

import * as ExpoTipkit from "expo-tipkit";
import { useRef } from "react";

export default function App() {
  const ref = useRef(null);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <ExpoTipkit.ExpoTipkitView id="tip1" title="Hello Rashila">
          <View style={{ height: 100, backgroundColor: "red" }}>
            <Text>Hello from React Native world</Text>
            <Button onPress={() => {}} title="Display Tip" />
          </View>
        </ExpoTipkit.ExpoTipkitView>
        <ExpoTipkit.ExpoTipkitView id="tip2" title="Hello Roshan">
          <View
            style={{ height: 100, backgroundColor: "blue", marginTop: 100 }}
          >
            <Text>Hello from React Native world</Text>
            <Button onPress={() => {}} title="Display Tip" />
          </View>
        </ExpoTipkit.ExpoTipkitView>

        <ExpoTipkit.ExpoTipkitView id="tip3" title="Hello Everyone">
          <View
            style={{ height: 100, backgroundColor: "yellow", marginTop: 100 }}
          >
            <Text>Hello from React Native world</Text>
            <Button onPress={() => {}} title="Display Tip" />
          </View>
        </ExpoTipkit.ExpoTipkitView>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
  },
});
