import { StyleSheet, Text } from 'react-native';
import onBoardImage from "../../assets/onboardingSlide3.png";
import Slide from "./Slide";

export default function OnboardingSlide2() {
  return (
    <Slide image={onBoardImage} nextBtnText="Continue" showSkip>
        <Text style={styles.title}>Set Appointment Reminders</Text>
        <Text style={styles.subtitle}>Brief description about</Text>
        <Text style={styles.subtitle}>one feature in the app</Text>
    </Slide>
  );
}

const styles = StyleSheet.create({
  title: {
    fontSize: 24,
    lineHeight: 43,
    fontWeight: 'bold',
    marginBottom: 12
  },

  subtitle: {
    fontSize: 18,
    lineHeight: 22
  }
});
