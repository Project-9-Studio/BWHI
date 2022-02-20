import { SafeAreaView, StyleSheet, View } from "react-native";
import { primaryBG } from "../../colors";
import NextBtn from "../NextBtn";

export default function SelectUniversity(props) {
  function onProfilePress(email) {
    //props.navigation?.push('AddProfilePic');
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={{ flex: 1 }} />
      <NextBtn
        text="Continue"
        style={styles.continueBtn}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignSelf: 'stretch',
    alignItems: 'center',
    backgroundColor: primaryBG
  },

  continueBtn: {
    marginBottom: 100
  }
});
