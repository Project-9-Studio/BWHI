import { SafeAreaView, StyleSheet } from 'react-native';
import { primaryBG } from '../../colors';

export default function HomeView() {
  return (
    <SafeAreaView style={styles.container}>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: primaryBG
  }
})
