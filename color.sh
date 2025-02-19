for i in {0..255}; do
      echo -e "$(tput setaf $i)$i $(tput sgr0)"
done
