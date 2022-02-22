import { NavigationContainer} from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import OnboardingStack from "./Onboarding";
import MainStack from "./MainNav";

const Stack = createNativeStackNavigator();

export default function AppNavigator() {
    return (
      <NavigationContainer>
        <Stack.Navigator initialRouteName="Main" screenOptions={{ headerShown: false }}>
          <Stack.Screen name="Onboarding" component={OnboardingStack} />
          <Stack.Screen name="Main" component={MainStack} />
        </Stack.Navigator>
      </NavigationContainer>
    );
}
