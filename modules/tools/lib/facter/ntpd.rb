Facter.add("ntpd") do
  setcode do
    %x{/bin/systemctl show -p LoadState ntpd}.split(/\n/)[0]
  end
end
