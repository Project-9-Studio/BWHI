import { useState } from "react";
import { Image, SafeAreaView, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import * as ImagePicker from 'expo-image-picker';
import { primaryBG } from "../../colors";
import NextBtn from "../NextBtn";
import SkipBtn from "../SkipBtn";

export default function AddProfilePic(props) {
  const [image, setImage] = useState();
  const onContinue = () => props.navigation?.push('SelectUniversity');

  async function onProfilePress() {
    // No permissions request is necessary for launching the image library
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.All,
      allowsEditing: true,
      aspect: [4, 3],
      quality: 1,
    });

    if (!result.cancelled) {
      setImage(result.uri);
    }
  }

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>Add profile photo?</Text>

      <TouchableOpacity onPress={onProfilePress}>
        <View style={styles.profileContainer}>
          {image && <Image source={{ uri: image }} style={styles.image} />}
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
  },

  image: {
    width: '100%',
    height: '100%',
    borderRadius: 40
  }
});
