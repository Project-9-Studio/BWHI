import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Intro from "../createAccount/CreateAccountIntro";
import PhoneNumber from "../createAccount/EnterPhoneNumber";

const Stack = createNativeStackNavigator();

export default function CreateAccountStackNavigator() {
  return (
    <Stack.Navigator initialRouteName="CreateAccountIntro" screenOptions={{ headerShown: false }}>
      <Stack.Screen name="CreateAccountIntro" component={Intro} />
      <Stack.Screen name="PhoneNumber" component={PhoneNumber} />
    </Stack.Navigator>
  );
}
