import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Intro from "../createAccount/CreateAccountIntro";
import PhoneNumber from "./AuthPhoneNumber";
import EnterFullname from "../createAccount/EnterFullname";
import EnterEmail from "../createAccount/EnterEmail";
import AddProfilePic from "../createAccount/AddProfilePic";
import SelectUniversity from "../createAccount/SelectUniversity";

const Stack = createNativeStackNavigator();

export default function CreateAccountStackNavigator() {
  return (
    <Stack.Navigator initialRouteName="CreateAccountIntro" screenOptions={{ headerShown: false }}>
      <Stack.Screen name="CreateAccountIntro" component={Intro} />
      <Stack.Screen name="PhoneNumber" component={PhoneNumber} />
      <Stack.Screen name="EnterFullname" component={EnterFullname} />
      <Stack.Screen name="EnterEmail" component={EnterEmail} />
      <Stack.Screen name="AddProfilePic" component={AddProfilePic} />
      <Stack.Screen name="SelectUniversity" component={SelectUniversity} />
    </Stack.Navigator>
  );
}
