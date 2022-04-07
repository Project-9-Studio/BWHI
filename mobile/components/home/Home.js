import { SafeAreaView, StyleSheet, View, Text, TouchableOpacity, Image } from 'react-native';
import { useRef, useState } from 'react';
import { TabView } from 'react-native-elements';
import BottomSheet from '@gorhom/bottom-sheet';
import { primaryBG } from '../../colors';
import SelectUniversityPicker from '../SelectUniversity';
import Card from "./Card";
import calendarIcon from '../../assets/calendar.png';
import SelectServices from "./SelectService";

import { createNativeStackNavigator } from '@react-navigation/native-stack';
const Stack = createNativeStackNavigator();

const services = [
  { title: 'University Student Health Services', address: 'CAU Suites 128 Mildred Street SW, Atlanta, Georgia 30314', hours: 'M-F 9am - 5pm' },
  { title: 'Counseling and Disability Services Center', address: 'Trevor Arnett Hall', hours: 'M-F 9am - 5pm' },
]

export default function HomeView(props) {
  const [index, setIndex] = useState(0);
  const bottomSheet = useRef();

  return (
    <SafeAreaView style={styles.container}>
      <View style={{ alignItems: 'center', marginBottom: 25  }}>
        <SelectUniversityPicker
          containerStyle={styles.pickerContainer}
        />
      </View>

      <TabView
        value={index}
        onChange={setIndex}
        animationType="spring"
        containerStyle={{ alignItems: 'center', justifyContent: 'center' }}
        tabItemContainerStyle={{ alignItems: 'center', justifyContent: 'center' }}
      >
        {services.map((item, index) => (
          <TabView.Item key={index} style={{ alignItems: 'center', width: '100%' }}>
            <Card {...item} navigation={props.navigation} bottomSheet={bottomSheet.current} />
          </TabView.Item>
        ))}
      </TabView>

      <View style={{ flex: 1, zIndex: -1 }} />

      <TouchableOpacity
        style={styles.addAptBtn}
      >
        <Image source={calendarIcon} style={styles.aptIcon} />
        <Text style={styles.aptText}>Add Appointment to Calendar</Text>
      </TouchableOpacity>

      <BottomSheet
        ref={bottomSheet}
        snapPoints={['40%', '50%']}
        index={-1}
        handleComponent={null}
        enablePanDownToClose
      >
        <Stack.Navigator initialRouteName="Blank" screenOptions={{ headerShown: false }}>
          <Stack.Screen name="SelectService" component={SelectServices} />
        </Stack.Navigator>
      </BottomSheet>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: primaryBG
  },

  pickerContainer: {
    marginTop: 20
  },

  addAptBtn: {
    justifyContent: 'center',
    alignItems: 'center',
    alignSelf: 'stretch',
    padding: 24,
    backgroundColor: 'white',
    borderRadius: 20,
    flexDirection: 'row',
    margin: 12,
    marginBottom: 30,
    paddingLeft: 34,
    paddingRight: 34
  },

  aptIcon: {
    marginRight: 15
  },

  aptText: {
    fontWeight: '600',
    fontSize: 18
  }
})
