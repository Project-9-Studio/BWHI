import { StyleSheet, Text } from 'react-native';
import onBoardImage from "../../assets/onboardingSlide1.png";
import Slide, { styles } from "./Slide";

export default function OnboardingSlide1(props) {
  return (
    <Slide
      image={onBoardImage}
      onSkipPress={() => props.navigation?.push('CreateAccount')}
      onNextPress={() => props.navigation?.push('Slide2')}
      showSkip
    >
      <Text style={styles.title}>Find your university</Text>
      <Text style={styles.subtitle}>
        Need to access care? Simply select your campus and be directed to a list
        of health services - from sexual health to mental health to crisis management.
      </Text>
    </Slide>
  );
}
