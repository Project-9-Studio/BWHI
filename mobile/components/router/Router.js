import { NavigationContainer } from '@react-navigation/native';
import OnboardingStack from "./Onboarding";

export default function AppNavigator() {
    return (
      <NavigationContainer>
        <OnboardingStack />
      </NavigationContainer>
    );
}
