import { StatusBar } from 'expo-status-bar';
import { StyleSheet, View } from 'react-native';
import Router from './components/router/Router';
import { primaryBG } from './colors';

export default function App() {
  return (
    <View style={styles.container}>
      <Router />
      <StatusBar style='dark' />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: primaryBG
  },
});
