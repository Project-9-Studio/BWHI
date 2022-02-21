import { StyleSheet, TouchableOpacity, Image } from 'react-native';
import icon from "../assets/bell.png";

export default function NotificationIcon(props) {return (
    <TouchableOpacity style={[styles.container, props.style]} onPress={props.onPress}>
      <Image source={icon} style={styles.image} />
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    width: 24,
    height: 24
  },

  image: {
    width: '100%',
    height: '100%'
  }
});
