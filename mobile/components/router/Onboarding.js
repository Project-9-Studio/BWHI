import { createNativeStackNavigator } from '@react-navigation/native-stack';
import OnboardingIntro from "../onboarding/OnboardIntro";
import OnboardingSlide1 from "../onboarding/OnboardingSlide1";
import OnboardingSlide2 from "../onboarding/OnboardingSlide2";
import OnboardingSlide3 from "../onboarding/OnboardingSlide3";
import CreateAccountNav from "./CreateAccount";

const Stack = createNativeStackNavigator();

export default function OnboardingStackNavigator() {
  return (
    <Stack.Navigator initialRouteName="Intro" screenOptions={{ headerShown: false }}>
      <Stack.Screen name="Intro" component={OnboardingIntro} />
      <Stack.Screen name="Slide1" component={OnboardingSlide1} />
      <Stack.Screen name="Slide2" component={OnboardingSlide2} />
      <Stack.Screen name="Slide3" component={OnboardingSlide3} />
      <Stack.Screen name="CreateAccount" component={CreateAccountNav} />
    </Stack.Navigator>
  );
}
