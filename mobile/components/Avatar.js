import { StyleSheet, TouchableOpacity, Image, View } from 'react-native';
import { Avatar } from 'react-native-elements';
import defaultAvatar from '../assets/defaultAvatar.png';

export default function ProfileAvatar(props) {return (
    <TouchableOpacity onPress={props.onPress}>
      <Avatar
        size={36}
        source={props.imageUrl ? { uri: props.imageUrl } : defaultAvatar}
        rounded
      />
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    width: 36,
    height: 36,
    borderRadius: 36,
    backgroundColor: 'white'
  },

  image: {}
});
