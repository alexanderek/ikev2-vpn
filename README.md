# IKEv2 VPN Server on Docker

Fork from [`gaomd/ikev2-vpn-server`](https://hub.docker.com/r/gaomd/ikev2-vpn-server/)

## Usage

### 1. Start the IKEv2 VPN Server.

    docker-compose up -d

    version: '2'
    services:

      ikev2-vpn:
      image: alexanderek/ikev2-vpn
      container_name: ikev2-vpn
      restart: always
      ports:
        - 500:500/udp
        - 4500:4500/udp
      cap_add:
        - NET_ADMIN
      environment:
        - HOST=<FQDN or IP>
        - HOSTNAME=ikev2-vpn-aws


  *Be sure to replace "FQDN" in docker-compose.yml*

### 2. Generate the .mobileconfig (for iOS / macOS) to the current path

    docker exec -it ikev2-vpn generate-mobileconfig > ikev2-vpn.mobileconfig

Transfer the generated `ikev2-vpn.mobileconfig` file to your local computer via SSH tunnel (`scp`) or any other secure methods.

### 3. Install the .mobileconfig (for iOS / macOS)

- **iOS 8 or later**: AirDrop the `.mobileconfig` file to your iOS device, finish the **Install Profile** screen;

- **macOS 10.11 or later**: Double click the `.mobileconfig` file to start the *profile installation* wizard.

## Technical Details

Upon container creation, a *shared secret* was generated for authentication purpose, no *certificate*, *username*, or *password* was ever used, simple life!

---

\* IKEv2 protocol requires iOS 8 or later, macOS 10.11 and later.

\* Install for **iOS 8 or later** or when your AirDrop fails: Send an E-mail to your iOS device with the `.mobileconfig` file as attachment, then tap the attachment to bring up and finish the **Install Profile** screen.
