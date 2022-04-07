import { useEffect, useState } from "react";
import { Keyboard, StyleSheet, Text, TextInput, View } from "react-native";
import BackBtn from '../BackBtn';
import NextBtn from '../NextBtn';
import InputView from './InputView';

export default function CreateAccountEnterNumber(props) {
  const [phoneNumber, setPhoneNumber] = useState("");

  function onChangeText(text) {
    setPhoneNumber(formatPhoneNumber(text));
  }

  useEffect(() => {
    if (phoneNumber.length === 14) {
      Keyboard.dismiss();
    }
  }, [phoneNumber])

  return (
    <InputView>
      <BackBtn onPress={() => props.navigation?.goBack()} />
      <Text style={styles.title}>Enter your phone number</Text>
      <Text style={styles.subtitle}>A verification code will be sent to this number.</Text>

      <TextInput
        style={styles.input}
        onChangeText={onChangeText}
        value={phoneNumber}
        keyboardType="phone-pad"
      />

      <View style={{ flex: 1}} />

      <NextBtn
        text="Continue"
        disabled={phoneNumber.length < 14}
        onPress={() => props.navigation?.push('AccountVerify')}
      />
    </InputView>
  );
}

const styles = StyleSheet.create({
  title: {
    fontSize: 24,
    lineHeight: 43,
    fontWeight: 'bold',
    textAlign: 'center',
    marginTop: 62
  },

  subtitle: {
    fontSize: 12,
    lineHeight: 22,
    textAlign: 'center',
    marginBottom: 20
  },

  input: {
    backgroundColor: 'white',
    color: 'black',
    marginLeft: 24,
    marginRight: 24,
    paddingLeft: 24,
    paddingRight: 24,
    paddingTop: 15,
    paddingBottom: 15,
    borderRadius: 12,
    fontSize: 22
  }
});

function formatPhoneNumber(value) {
  // if input value is falsy eg if the user deletes the input, then just return
  if (!value) return value;

  // clean the input for any non-digit values.
  const phoneNumber = value.replace(/[^\d]/g, '');

  // phoneNumberLength is used to know when to apply our formatting for the phone number
  const phoneNumberLength = phoneNumber.length;

  // we need to return the value with no formatting if its less than four digits
  // this is to avoid weird behavior that occurs if you  format the area code too early
  if (phoneNumberLength < 4) return phoneNumber;

  // if phoneNumberLength is greater than 4 and less the 7 we start to return
  // the formatted number
  if (phoneNumberLength < 7) {
    return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(3)}`;
  }

  // finally, if the phoneNumberLength is greater then seven, we add the last
  // bit of formatting and return it.
  return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(
    3,
    6
  )}-${phoneNumber.slice(6, 10)}`;
}