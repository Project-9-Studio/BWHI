import * as ImagePicker from 'expo-image-picker';
import { useEffect, useState } from 'react';

export default function useMediaLibrary() {
  const [status, setStatus] = useState();

  useEffect(() => {
    ImagePicker.requestMediaLibraryPermissionsAsync()
      .then((req) => {
        setStatus(req.status);
      });
  }, []);

  return status;
}