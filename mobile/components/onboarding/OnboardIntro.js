import { StyleSheet, Text } from 'react-native';
import onBoardIntro from "../../assets/onboardIntro.png";
import Slide from "./Slide";

export default function OnboardingIntro() {
  return (
    <Slide image={onBoardIntro}>
      <Text style={styles.title}>Campus Health App</Text>
      <Text style={styles.subtitle}>Learn where to find health services</Text>
      <Text style={styles.subtitle}>available on your college campus</Text>
    </Slide>
  );
}

const styles = StyleSheet.create({
  title: {
    fontSize: 36,
    lineHeight: 43,
    fontWeight: 'bold',
    marginBottom: 12
  },

  subtitle: {
    fontSize: 18,
    lineHeight: 22
  }
});
