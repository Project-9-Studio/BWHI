import { StyleSheet, TouchableOpacity, Text } from 'react-native';

export default function OnboardSkipBtn(props) {return (
    <TouchableOpacity style={styles.container} onPress={props.onPress}>
      <Text style={styles.text}>Skip</Text>
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
