import { StyleSheet, TouchableOpacity, Text, Image } from 'react-native';
import icon from "../assets/arrow-left.png";

export default function BackButton(props) {return (
    <TouchableOpacity style={[styles.container, props.style]} onPress={props.onPress}>
      <Image source={icon} style={styles.icon} />
      <Text style={styles.text}>Back</Text>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 16,
    marginLeft: 24
  },

  text: {
    color: 'black',
    fontSize: 18,
    lineHeight: 21
  },

  icon: {
    width: 24,
    height: 24,
    marginRight: 6
  }
});
