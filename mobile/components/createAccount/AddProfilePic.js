import { SafeAreaView, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import { primaryBG } from "../../colors";
import NextBtn from "../NextBtn";
import SkipBtn from "../SkipBtn";
import TextInputView from "./TextInputView";

export default function AddProfilePic(props) {
  const onContinue = () => props.navigation?.push('SelectUniversity');
  function onProfilePress(email) {
    //props.navigation?.push('AddProfilePic');
  }

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>Add profile photo?</Text>

      <TouchableOpacity onPress={onProfilePress}>
        <View style={styles.profileContainer}>

        </View>
      </TouchableOpacity>

      <View style={{ flex: 1 }} />

      <SkipBtn btnText="Skip for now" style={styles.skipBtn} onPress={onContinue} />
      <NextBtn
        text="Continue"
        style={styles.continueBtn}
        onPress={onContinue}
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

  title: {
    marginTop: 75,
    marginBottom: 40,
    fontSize: 24,
    fontWeight: '700'
  },

  profileContainer: {
    backgroundColor: '#ececec',
    width: 150,
    height: 150,
    borderRadius: 40
  },

  skipBtn: {
    alignItems: 'center',
    marginRight: 0,
    marginBottom: 20,
    padding: 10
  },

  continueBtn: {
    marginBottom: 100
  }
});
