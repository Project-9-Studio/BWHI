import { Image, SafeAreaView, StyleSheet, Text, View } from "react-native";
import NextBtn from '../NextBtn';
import { primaryBG } from "../../colors";

export default function CreateAccountEnterNumber() {
    return (
      <SafeAreaView style={styles.container}>
        <Text>Enter your phone number</Text>
        <Text>A verification code will be sent to this number.</Text>
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
