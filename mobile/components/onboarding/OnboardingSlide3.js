import { StyleSheet, Text } from 'react-native';
import onBoardImage from "../../assets/onboardingSlide3.png";
import Slide, { styles } from "./Slide";

export default function OnboardingSlide2(props) {
  return (
    <Slide
      image={onBoardImage}
      nextBtnText="Continue"
      onNextPress={() => props.navigation?.push('CreateAccount')}
    >
        <Text style={styles.title}>Ring the Alarm!</Text>
        <Text style={styles.subtitle}>
          The built-in appointment reminder helps you keep track of your annual exams, 
          monthly self-breast exam, or any upcoming clinic visits.
        </Text>
    </Slide>
  );
}
