import { useState } from "react";
import { Image, SafeAreaView, StyleSheet, TouchableOpacity, View } from "react-native";
import {Picker} from '@react-native-picker/picker';
import { primaryBG } from "../../colors";
import NextBtn from "../NextBtn";
import icon from "../../assets/chevron-down.png";

export function SelectUniversity(props) {
  const [value, setValue] = useState('');

  function onContinue() {
    props.navigation?.push('Main');
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={{ flex: 1, justifyContent: 'center' }}>
        <TouchableOpacity>
          <View style={styles.pickerContainer}>
            <Picker
              style={{ width: '90%' }}
              selectedValue={value}
              onValueChange={(itemValue) => setValue(itemValue)}
            >
              <Picker.Item label="Select a university" value="" />
              <Picker.Item label="Clark" value="java" />
              <Picker.Item label="JavaScript" value="js" />
            </Picker>
            <Image source={icon} />
          </View>
        </TouchableOpacity>
      </View>

      <NextBtn
        text="Continue"
        style={styles.continueBtn}
        disabled={value === ""}
        onPress={onContinue}
      />
    </SafeAreaView>
  );
}

export default SelectUniversity;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignSelf: 'stretch',
    alignItems: 'center',
    backgroundColor: primaryBG
  },

  continueBtn: {
    marginBottom: 100
  },

  pickerContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginRight: 24,
    marginLeft: 24
  },

  pickerText: {
    fontSize: 36,
    fontWeight: '500'
  }
});
