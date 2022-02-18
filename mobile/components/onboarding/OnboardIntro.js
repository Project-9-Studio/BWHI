import { TouchableOpacity, StyleSheet, SafeAreaView, Text, Image, View } from 'react-native';
import { primaryBG } from "../../colors";
import onBoardIntro from "../../assets/onboardIntro.png";

export default function OnboardingIntro() {
  return (
    <SafeAreaView style={styles.container}>
        <Image source={onBoardIntro} style={styles.image} />

        <Text style={styles.title}>Campus Health App</Text>
        <Text style={styles.subtitle}>Learn where to find health services</Text>
        <Text style={styles.subtitle}>available on your college campus</Text>

        <View style={{ flex: 1 }} />

        <TouchableOpacity style={styles.btn} onPress={() => Alert.alert('Left button pressed')}>
            <Text style={styles.btnText}>Get Started</Text>
        </TouchableOpacity>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignSelf: 'stretch',
    backgroundColor: primaryBG,
    alignItems: 'center'
  },

  image: {
    width: 343,
    height: 310,
    marginTop: 25,
    marginBottom: 48
  },

  title: {
    fontSize: 36,
    lineHeight: 43,
    fontWeight: 'bold',
    marginBottom: 12
  },

  subtitle: {
    fontSize: 18,
    lineHeight: 22
  },

  btn: {
      marginLeft: 24,
      marginRight: 24,
      marginBottom: 60,
      backgroundColor: '#000',
      alignSelf: 'stretch',
      padding: 15,
      borderRadius: 12
  },

  btnText: {
      color: '#fff',
      textAlign: 'center',
      fontSize: 22
  }
});
