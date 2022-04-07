import { StyleSheet, SafeAreaView, Image, View } from 'react-native';
import { primaryBG } from "../../colors";
import SkipBtn from "../SkipBtn";
import NextBtn from "../NextBtn";

export default function Slide(props) {
  return (
    <SafeAreaView style={styles.container}>
      {props.showSkip && <SkipBtn onPress={props.onSkipPress} />}

      <Image source={props.image} style={styles.image} />

      {props.children}

      <View style={{ flex: 1 }} />

      <NextBtn
        text={props.nextBtnText || "Next"}
        onPress={props.onNextPress}
      />
    </SafeAreaView>
  );
}

export const styles = StyleSheet.create({
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
    fontSize: 24,
    lineHeight: 43,
    fontWeight: 'bold',
    marginBottom: 12
  },

  subtitle: {
    fontSize: 18,
    lineHeight: 22,
    paddingLeft: 24,
    paddingRight: 24,
    textAlign: 'center'
  }
});
