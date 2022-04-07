import { Image, StyleSheet, Text, View } from 'react-native';
import { TouchableOpacity } from 'react-native-gesture-handler';
import serviceIcon from '../../assets/arrow-up-right.png';
import phoneIcon from '../../assets/phone.png';
import navIcon from '../../assets/navigation.png';
import globe from '../../assets/globe.png';

export default function HomeCard(props) {
  function viewServices() {
    props.navigation.navigate('SelectService');
    props.bottomSheet?.snapToIndex?.(0);
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>{props.title}</Text>
      <View style={styles.divider} />
      <View style={{ alignItems: 'flex-start', alignSelf: 'stretch' }}>
        <Text style={styles.description}>{props.address}</Text>
        <Text style={styles.description}>{props.hours}</Text>
      </View>

      <View style={{ flex: 1}} />

      <TouchableOpacity style={styles.viewServices} onPress={viewServices}>          
        <Text style={{ fontWeight: '600', fontSize: 18 }}>View Services</Text>
        <Image source={serviceIcon} style={{ width: 24, height: 24 }} />
      </TouchableOpacity>

      <View style={{ flexDirection: 'row', height: 46, justifyContent: 'space-between', alignItems: 'center', alignSelf: 'stretch', marginBottom: 20 }}>
        <ActionButton
          icon={phoneIcon}
          containerStyle={{ flex: 1, marginRight: 16 }}
          text="Call"
          onPress={() => console.log('call')}
        />
        <ActionButton
          icon={navIcon}
          containerStyle={{ flex: 1 }}
          text="Directions"
          onPress={() => console.log('directions')}
        />
      </View>

      <ActionButton
        icon={globe}
        containerStyle={{ width: '100%' }}
        text="View Website"
          onPress={() => console.log('website')}
      />
    </View>
  );
}

function ActionButton(props) {
  return (
    <TouchableOpacity style={[styles.actionBtn, props.containerStyle]} onPress={props.onPress}>
      <Image source={props.icon} style={{ marginRight: 10 }} />
      <Text style={styles.actionText}>{props.text}</Text>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'column',
    width: '90%',
    height: 428,
    backgroundColor: 'white',
    padding: 16,
    borderRadius: 20
  },

  title: {
    fontWeight: '500',
    fontSize: 20,
    paddingBottom: 14
  },

  divider: {
    borderWidth: 1,
    borderColor: '#9E9C8A',
    width: '100%'
  },

  description: {
    marginTop: 14,
    textAlign: 'left'
  },
  viewServices: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    borderRadius: 20,
    borderWidth: 1,
    borderColor: '#CBCBCB',
    padding: 16,
    alignSelf: 'stretch',
    marginBottom: 30
  },
  actionBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 12,
    backgroundColor: '#FFC41C',
    borderRadius: 20,
    paddingLeft: 26,
    paddingRight: 26
  },
  actionText: {
    fontSize: 18,
    fontWeight: '600'
  }
})
