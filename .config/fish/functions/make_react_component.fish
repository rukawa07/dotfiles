function make_react_component
  if test "$argv" = ""
    echo "Input a component name."
  else
    mkdir $argv
    cd ./$argv

    echo "type SampleProps = {"\n"};"\n\n"const Sample = (props:SampleProps) => {"\n"return <></>;"\n"};"\n\n"export default Sample;" > index.tsx
    gsed -i s/Sample/$argv/g index.tsx
    echo "import { StyleSheet } from 'react-native';"\n\n"export const styles = StyleSheet.create({"\n"});" > styles.ts
    touch hooks.tsx
  end
end
