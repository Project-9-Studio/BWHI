import { useState } from "react";
import { StyleSheet, Text, TextInput, View } from "react-native";
import NextBtn from '../NextBtn';
import InputView from './InputView';

export default function TextInputView(props) {
  const [value, setValue] = useState("");

  function onChangeText(text) {
    setValue(text);
  }

  return (
    <InputView>
      <Text style={styles.title}>{props.title}</Text>

      <TextInput
        style={styles.input}
        onChangeText={onChangeText}
        value={value}
        keyboardType={props.keyboardType}
        autoFocus
      />

      <View style={{ flex: 1}} />

      <NextBtn
        text="Continue"
        disabled={value === ""}
        onPress={() => props.onContinue?.(value)}
      />
    </InputView>
  );
}

const styles = StyleSheet.create({
  title: {
    fontSize: 24,
    lineHeight: 43,
    fontWeight: 'bold',
    marginBottom: 42,
    textAlign: 'center',
    marginTop: 100
  },

  input: {
    backgroundColor: 'white',
    color: 'black',
    marginLeft: 24,
    marginRight: 24,
    paddingLeft: 20,
    paddingRight: 20,
    paddingTop: 15,
    paddingBottom: 15,
    borderRadius: 12,
    fontSize: 22
  }
});
