import { StyleSheet, TouchableOpacity, Text } from 'react-native';

export default function SkipBtn(props) {return (
    <TouchableOpacity style={[styles.container, props.style]} onPress={props.onPress}>
      <Text style={styles.text}>{props.btnText || "Skip"}</Text>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    alignSelf: 'stretch',
    alignItems: 'flex-end',
    marginRight: 34,
    marginTop: 16
  },

  text: {
    color: 'black',
    fontWeight: "500",
    fontSize: 18,
    lineHeight: 21
  },
});
