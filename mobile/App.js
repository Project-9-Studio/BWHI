import { StatusBar } from 'expo-status-bar';
import { StyleSheet, View } from 'react-native';
import { ActionSheetProvider } from '@expo/react-native-action-sheet';
import Router from './components/router/Router';
import { primaryBG } from './colors';

export default function App() {
  return (
    <ActionSheetProvider>
      <View style={styles.container}>
        <Router />
        <StatusBar style='dark' />
      </View>
    </ActionSheetProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: primaryBG
  },
});
