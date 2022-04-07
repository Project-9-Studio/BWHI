import { StyleSheet, Text } from 'react-native';
import onBoardImage from "../../assets/onboardingSlide2.png";
import Slide, { styles } from "./Slide";

export default function OnboardingSlide2(props) {
  return (
    <Slide
      image={onBoardImage}
      onSkipPress={() => props.navigation?.push('CreateAccount')}
      onNextPress={() => props.navigation?.push('Slide3')}
      showSkip
    >
        <Text style={styles.title}>Help a Sister Out!</Text>
        <Text style={styles.subtitle}>
          Student health and counseling centers are there for you - 
          providing an array of important services to help you manage your health.
        </Text>
    </Slide>
  );
}
