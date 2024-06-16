import { Button, SafeAreaView, StyleSheet, Text, View } from "react-native";

import * as ExpoTipkit from "expo-tipkit";
import { useRef, useState } from "react";

export default function App() {
  const ref = useRef(null);

  const [showCount, setShowCount] = useState(0);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <ExpoTipkit.ExpoTipkitView
          id="tip5"
          title="Hello Roshan"
          show={showCount === 3}
        >
          <View style={{ height: 100, backgroundColor: "blue" }}>
            <Text>Hello from React Native world</Text>
            <Button
              onPress={() => {
                setShowCount(showCount + 1);
              }}
              title="Display Tip"
            />
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
