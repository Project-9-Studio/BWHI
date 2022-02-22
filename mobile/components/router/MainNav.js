import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { View } from 'react-native';
import { primaryBG } from '../../colors';
import Home from "../home/Home";
import Avatar from "../Avatar";
import AlertIcon from '../Alert';
import NotificationIcon from '../Notification';

const Stack = createNativeStackNavigator();

export default function MainStackNavigator() {
  return (
    <Stack.Navigator
      initialRouteName="Home"
      screenOptions={{
        headerStyle: { backgroundColor: primaryBG },
        headerShadowVisible: false,
        headerTitle: '',
        headerLeft: HeaderLeft,
        headerRight: HeaderRight
      }}
    >
      <Stack.Screen name="Home" component={Home} />
    </Stack.Navigator>
  );
}

function HeaderLeft() {
  return <Avatar />;
}

function HeaderRight() {
  return (
    <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'center' }}>
      <AlertIcon style={{ marginRight: 20 }} />
      <NotificationIcon />
    </View>
  );
}
