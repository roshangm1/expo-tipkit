import { StyleSheet, Text, View } from 'react-native';

import * as ExpoTipkit from 'expo-tipkit';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>{ExpoTipkit.hello()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
