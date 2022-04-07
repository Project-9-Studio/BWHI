import { useState } from 'react';
import { Image, StyleSheet, Text, TouchableOpacity, View, useWindowDimensions } from 'react-native';
import { Button, BottomSheet } from 'react-native-elements';
import { Picker } from '@react-native-picker/picker';
import icon from "../assets/chevron-down.png";

const schools = [
  { label: 'Select a school', value: '' },
  { label: 'Clark Atlanta', value: 'clark' }
];

export default function SelectUniversityPicker(props) {
  const [showModal, setShowModal] = useState(false);
  const [value, setValue] = useState(props.value || schools[0]);
  const window = useWindowDimensions();
  const onSelect = (_, index) => setValue(schools[index]);

  return (
    <>
      <TouchableOpacity onPress={() => setShowModal(true)}>
        <View style={[styles.container, props.containerStyle]}>
          <Text style={[styles.text, props.textStyle]}>
            {value.label}
          </Text>
          <Image source={icon} style={styles.icon} />
        </View>
      </TouchableOpacity>

      <BottomSheet
        modalProps={{ onPress: () => setShowModal(false) }}
        isVisible={showModal}
        containerStyle={{ zIndex: -1 }}
      >
        <View style={[styles.bottomSheetContainer, { height: window.height / 2.25 }]}>
          <Picker
            selectedValue={value.value}
            onValueChange={onSelect}
            style={{ alignSelf: 'stretch' }}
            itemStyle={{ color: 'white', height: 200 }}
          >
            {schools.map(({ label, value }, index) => <Picker.Item label={label} value={value} key={index} />)}
          </Picker>

          <View style={{ flex: 1 }} />

          <Button
            title="Continue"
            buttonStyle={{ backgroundColor: 'white', width: '100%' }}
            titleStyle={{ color: 'black' }}
            onPress={() => setShowModal(false)}
          />
        </View>
      </BottomSheet>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center'
  },

  text: {
    color: 'black',
    fontWeight: "600",
    fontSize: 20,
    lineHeight: 24
  },

  icon: {
    width: 24,
    height: 24
  },

  bottomSheetContainer: {
    flex: 1,
    alignItems: 'center',
    backgroundColor: 'black',
    height: 400,
    padding: 28
  }
});
