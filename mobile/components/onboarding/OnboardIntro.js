import { Image, SafeAreaView, Text, View, TouchableOpacity } from 'react-native';
import onBoardIntro from "../../assets/onboardIntro.png";
import NextBtn from "../NextBtn";
import { styles } from "./Slide";

export default function OnboardingIntro(props) {
  return (
    <SafeAreaView style={styles.container}>
      <Image source={onBoardIntro} style={styles.image} />

      <Text style={styles.title}>Campus Health App</Text>
      <Text style={styles.subtitle}>
        We get it Sis!  Being a college student, is a lot. 
        But prioritizing your health should be a non negotiable!
      </Text>

      <View style={{ flex: 1 }} />

      <View style={{ flexDirection: 'column', alignSelf: 'stretch', alignItems: 'center' }}>
        <NextBtn
          text="Get Started"
          onPress={() => props.navigation?.push('Slide1')}
          style={{ alignSelf: 'stretch', marginBottom: 28 }}
        />
        
        <View style={{ flexDirection: 'row', alignItems: 'center', paddingBottom: 48 }}>
          <Text >
            Already have an account?
          </Text>
          <TouchableOpacity onPress={() => props.navigation?.push('SignIn')}>
            <Text style={{ marginLeft: 5, color: 'white'}}>Sign in</Text>
          </TouchableOpacity>
        </View>
      </View>
    </SafeAreaView>
  );
}
