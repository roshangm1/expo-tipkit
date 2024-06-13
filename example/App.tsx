import { Pressable, StyleSheet, Text, View } from "react-native";

import * as ExpoTipkit from "expo-tipkit";
import { useEffect, useRef } from "react";

export default function App() {
  const ref = useRef(null);

  useEffect(() => {
    if (ref.current) {
      const tag = ref.current._nativeTag;
      console.log("tag", tag);
      ExpoTipkit.displayTip("searchTip", tag);
    }
  }, [ref.current]);

  return (
    <View style={styles.container} ref={ref}>
      <ExpoTipkit.ExpoTipkitView>
        <Text>Hello world</Text>
      </ExpoTipkit.ExpoTipkitView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
