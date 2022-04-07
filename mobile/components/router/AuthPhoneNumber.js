import { createNativeStackNavigator } from '@react-navigation/native-stack';
import PhoneNumber from "../createAccount/EnterPhoneNumber";
import CreateAccountVerify from "../createAccount/EnterVerification";

const Stack = createNativeStackNavigator();

export default function AuthPhoneNumberNavigator() {
  return (
    <Stack.Navigator initialRouteName="EnterPhoneNumber" screenOptions={{ headerShown: false }}>
      <Stack.Screen name="EnterPhoneNumber" component={PhoneNumber} />
      <Stack.Screen name="AccountVerify" component={CreateAccountVerify} />
    </Stack.Navigator>
  );
}
