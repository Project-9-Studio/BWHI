import { StyleSheet, Text } from 'react-native';
import onBoardImage from "../../assets/onboardingSlide1.png";
import Slide from "./Slide";

export default function OnboardingSlide1(props) {
  return (
    <Slide
      image={onBoardImage}
      onSkipPress={() => props.navigation?.push('CreateAccount')}
      onNextPress={() => props.navigation?.push('Slide2')}
      showSkip
    >
      <Text style={styles.title}>Find your university</Text>
      <Text style={styles.subtitle}>Learn where to find health services</Text>
      <Text style={styles.subtitle}>available on your college campus</Text>
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
