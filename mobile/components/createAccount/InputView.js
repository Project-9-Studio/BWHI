import { Keyboard, KeyboardAvoidingView, SafeAreaView, StyleSheet, TouchableWithoutFeedback } from "react-native";
import { primaryBG } from "../../colors";

export default function InputView(props) {
  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === "ios" ? "padding" : "height"}
      style={{ flex: 1 }}
    >
      <TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
        <SafeAreaView style={[styles.container, props.style]}>
          {props.children}
        </SafeAreaView>
      </TouchableWithoutFeedback>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
    container: {
      flex: 1,
      alignSelf: 'stretch',
      backgroundColor: primaryBG
    }
  });
