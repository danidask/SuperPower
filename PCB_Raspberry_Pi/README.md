<!-- https://github.com/othneildrew/Best-README-Template -->


<h3 align="center">SuperPower_Raspberry_Pi PCB</h3>


## Table of Contents

- [Table of Contents](#table-of-contents)
- [Usage](#usage)
- [Conventions](#conventions)
- [License](#license)
- [References](#references)
- [Acknowledgements](#acknowledgements)



## Usage

Design with [kicad 5](https://kicad-pcb.org/)



## Conventions

In order to make the BOM jlcpcb compilant, we use a custom python script and some conventions in kicad:

- Each component must have a custom field named "PartNumber" with the lcsc part number
- The components can have a custom field named "Keys" with one special word:
  - DNP  (Do Not Place) This component will not be sent for assambley and will be included in a separated file
  - EXCLUDE This component will not apear in any of the BOM files (ej mounting holes)

To add this custom fields in kicad 5.1:
- Select the component (left click)
- Press "E" to open symbol properties
- Add Field (plus sign)



## License

Distributed under the MIT License. See `LICENSE` for more information.



## References

https://github.com/raspberrypi/hats/



## Acknowledgements

* []()
