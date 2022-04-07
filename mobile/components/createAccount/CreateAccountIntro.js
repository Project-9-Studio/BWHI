import { Image, SafeAreaView, StyleSheet, Text, View } from "react-native";
import NextBtn from '../NextBtn';
import SkipBtn from '../SkipBtn';
import onboardImage from "../../assets/createAccountIntro.png";
import { primaryBG } from "../../colors";

export default function CreateAccountIntro(props) {
    return (
      <SafeAreaView style={styles.container}>
        <Image source={onboardImage} style={styles.image} />

        <Text style={styles.title}>Create an Account</Text>
        <Text style={styles.subtitle}>Learn where to find health services</Text>
        <Text style={styles.subtitle}>available on your college campus</Text>

        <View style={{ flex: 1 }} />

        <NextBtn text="Continue" style={styles.nextBtn} onPress={() => props.navigation?.push("PhoneNumber")} />
        <SkipBtn btnText="Continue as guest" style={styles.skipBtn} onPress={() => props.navigation?.push('Main')} />
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
  
    image: {
      width: 343,
      height: 310,
      marginTop: 25,
      marginBottom: 48
    },

    title: {
      fontSize: 24,
      lineHeight: 43,
      fontWeight: 'bold',
      marginBottom: 12
    },
  
    subtitle: {
      fontSize: 18,
      lineHeight: 22
    },

    nextBtn: {
      marginBottom: 10
    },

    skipBtn: {
      marginLeft: 24,
      marginBottom: 80,
      alignItems: 'center'
    }
  });
