import { StatusBar } from 'expo-status-bar';
import { StyleSheet, View } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import Router from './components/router/Router';
import { primaryBG } from './colors';

export default function App() {
  return (
    <SafeAreaProvider>
      <View style={styles.container}>
        <Router />
        <StatusBar style='dark' />
      </View>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: primaryBG
  },
});
