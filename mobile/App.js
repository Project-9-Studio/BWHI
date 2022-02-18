import { StatusBar } from 'expo-status-bar';
import { StyleSheet, View } from 'react-native';
import OnboardIntro from './components/onboarding/OnboardIntro';

export default function App() {
  return (
    <View style={styles.container}>
      <OnboardIntro />
      <StatusBar style='dark' />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
