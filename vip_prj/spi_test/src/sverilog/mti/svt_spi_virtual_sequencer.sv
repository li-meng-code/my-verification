
`ifndef GUARD_SVT_SPI_VIRTUAL_SEQUENCER_SV
`define GUARD_SVT_SPI_VIRTUAL_SEQUENCER_SV

`ifndef SVT_VMM_TECHNOLOGY

// =============================================================================
/**
 * This class defines a virtual sequencer that can be connected easily to the svt_spi_agent.
 */
//class svt_spi_virtual_sequencer extends `SVT_XVM(sequencer);
class svt_spi_virtual_sequencer extends `SVT_XVM(sequencer)#(`SVT_XVM(sequence_item),`SVT_XVM(sequence_item));

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Sequencer which can supply transaction requests. */
  svt_spi_transaction_sequencer transaction_seqr;
  
  /** Sequencer which can supply service requests. */
  svt_spi_service_sequencer service_seqr;

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  /** SVT message macros route messages through this reference */
  local `SVT_XVM(report_object) reporter = this;

  /** Configuration object for this sequencer. */
  local svt_spi_agent_configuration cfg;

  //----------------------------------------------------------------------------
  // Component Macros
  //----------------------------------------------------------------------------

  `svt_xvm_component_utils_begin(svt_spi_virtual_sequencer)

    `svt_xvm_field_object(transaction_seqr,    `SVT_XVM_ALL_ON|`SVT_XVM_REFERENCE)
    `svt_xvm_field_object(service_seqr,    `SVT_XVM_ALL_ON|`SVT_XVM_REFERENCE)

  `svt_xvm_component_utils_end

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new virtual sequencer instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name.
   * @param parent Establishes the parent-child relationship.
   */
   extern function new(string name = "svt_spi_virtual_sequencer", `SVT_XVM(component) parent = null);

  //----------------------------------------------------------------------------
  /**
   * Finds the first sequencer that has a `SVT_XVM(agent) for its parent.
   * If p_sequencer parent is a `SVT_XVM(agent), returns that `SVT_XVM(agent). Otherwise
   * continues looking up the sequence's parent sequence chain looking for a
   * p_sequencer which has a `SVT_XVM(agent) as its parent.
   *
   * @param seq The sequence that needs to find its agent.
   * @return The first agent found by looking through the parent sequence chain.
   */
  extern virtual function `SVT_XVM(agent) find_first_agent(`SVT_XVM(sequence_item) seq);

  //----------------------------------------------------------------------------
  /**
   * Gets the shared_status associated with the agent associated with the virtual sequencer.
   *
   * @param seq The sequence that needs to find its shared_status.
   * @return The shared_status for the associated agent.
   */
  extern virtual function svt_spi_status get_shared_status(`SVT_XVM(sequence_item) seq);

  //----------------------------------------------------------------------------
  /**
   * Updates the sequencer's configuration with the supplied object. Also updates
   * the configurations for the contained sequencers.
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a reference of the sequencer's configuration object.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
i1udg5t9swSzAdIGLqCqV3yjBdPrHdNmZ89kIeZ6QiIa26RJ4Qpcn8VyYXR7/7t+
DW8/0HiYI0rIPeEEOnR3JO5p3VloqRl0nkd4wPetrO98lilri8SZ6/GaC8CjwUzC
x/dJ8ZRWdwEGnsE6/FrjwBNWJVrJssh+X5tBa1KqXqU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2526      )
3wNUmXqh8CT84SOx0Tjge1awbF6PgZ8WJau25cpM13W0N50qvrHHE6R3Ghg6Eybv
4NAG9+DeyGxjzfnrDuTtNVYd3iMlaG3oneKt0bnbYgj4bmGLhYC1Z/UsayhXAhBW
FIlyhpEez48Akva+ZX8HgIb8wSREuKENYj9fjUYshtwhjhR/E1ZbSPhVcB1jFknS
W6pLQyjbAo5Y2iXdXG58ovkEHFXGP2vWWyElSB3fxajklYHfQeHoR7+zOImDOh8C
3g1utmvZAWyYZWbnssuzhiF98yZwPS3ogEwrAHmSVNUiSmSv55ML36M8NHo+hUW3
SruAk1oSvPLjoQ0DUPOzhNCU9tbT+wcs2acB5Xv18um8oS1yPYhfLHyKT5WdP+9R
E2ONWXtX0VjUcdTQk6DONBiXdfi0EyIKnX2ftZk1LNZ3JVdm3hEQrQ8nbQy1aWzY
0NEIUfWoMU6OJamLqQUNw0QqSMqZS2/nzTE45FXqVyKrKADlonu7pVRwqrJBA+O2
AL6VWcld5HyJyAfovBYOGuWkAba4WJPRYP+U57q1GwADfFlfnrea/ANvm8fvLG12
RPIzw2+yHnE70OyF4wfsxLo01OPqnq7iobSnHjusfeNe64MDri6965C4roa+A9DI
v2NhLseB2LQk3gpdK8xoI0G569ieDSnCykTLkB/s7noAw8ZywUqvDvPXIZM5QCUj
C8WAjNGmrkBnak2mUwH8ZalaXbK9A5bb3XmQYXOrQ2dY6SruijHMic+RHvastjyz
6ImG/ICudZA4I50/6Dr+QB2fyMQBBR+hJDua8ALMsAvcHkYmyHqOk8DgAw9autYU
zntmRLGBMnMQJcU+kQ8B6ouIFlzt/AOXoWhJ2Ig05j+gF2kOk3od6bOwwm2zJO4Q
zADAnqnMq0T4ru2u6R/Dx0iIo4NHaMfGkzg5Nk9Ms/G7oE+x1ObrgkuyHDtv+5oI
G5/MXPySXd8GSKuz1mazZXElO2T0tJW05LJ/KfOSUtFBOQWGAl3KAtiO9mOGYjoC
QAClM2EIfAlXqAGWuiVAF/K/6Tl89Nu77VCFTcSXJ5086niFGUcegypwLUbNuM6E
pgHzw+KZjsgXwJ9GrW1U4iUi66ldgebtSZD3ZEx3NpRwvm8aDeeAmJl2FYKyLD0J
Wqce0BoJvPuojKJYee1nEVUoZLc/5nVnM/N7FAXO5bTQ6CRvlwmlLykJmqO7b+TS
RsVGGyB3Iz5qZ2I3Z29Anwfk85MBUgRQrc15+ctIgOZGzVvowHIvhPqQueysquia
yM+HA6N6D8CaOUjYLNDK75/UJMsparrTzxrF9NTPPLfKlT+WB58AcQtyJo0e7jzk
GGt4w5ZNdmbJ5BjtmTTJegRFMqY+gXpvWQ6NLx3phyG/Yl41f4eKA3JWz5rxF6o8
ZEBhUlr1eY+NMBgUW+YBui8sbtHsbUbzG4cEyPBowBVJ3hVhRqvz08csJQ4ambPS
nVkbJmYLg8jlqFzmMIBa9MDpQFUCY6myMFQzWPi4WM8CAfulEUTrXfnRJR806Gk3
QlWFt6yHm+j86t/feFUcrotiHMgedgBldl2+0S7IfhWZz3VEXvnJDru1NnrTl8HX
xqJ+E/PMLTRi3wduMVTS9SxpkLJzkLLi+LifUFJWMArzkp8sN7TTE3HQmiuD+gVz
/dUmlh40jVVkI0b0+zOUZIOpQEeX14qfL1vMjSCh8mMOUizWKNKIyISE0bex0To5
YIomWAFn2inTWW4yHDI/21mV4eKyaGPZFRNG3JjN0Io2bfSi3tr7UwyDizLYI+lG
OhoMHUOy3UUpD8ZyETSVG90AkFj8Y6u7SwYaQ1eS1PJbghIIlE5g6abyAsvk85Rp
5EeTrmzciWBwIVHokl9uwoUZhHHSH5WPXGa9P5wZc/3qALc2gbw8qg7QoHndxAwn
qTAgZcdNKarfAdzMX+EjJqLK/rA12oyrOu2i0F8nvFPcV5lFgugcvK0csXN98hyv
dAh5tw4Ok6nU3JDiw9dGggc0vIBN3AdfhpWlc7HL111riLHKbP/4tl0GR/QEXvIi
LOIGhjTNSCpQI4C8wtyr0PgpK/TU4wBfz7CnWG4Qev7gNgO7XBz87ncMZAEdybSc
TC19g8SXi/R37M3+vFRobmPUWGXmtSDo/fPwvKcZhPt8RBqm+/q5HLnhznhrqQ70
dzTftZtF7pNJ5L8s4VSjWYo6fw5aqFixsyZK2F5WEVo9KN0hpGiq+PKZijDCUlhr
XIrBEkOw2AU5Kd7FXk1A1A0LLG25NpIDmrtTd58+VQU/NGyJvH3y8gwX+ZJSeFXT
7ZLhC/IabibH0E10u+f920YIA4JaMwN+8KaNL/It0GOUKVJN18yFt2hQCtt+6Iqu
neUkQkHJtg6+Z4t2G5TJcdFMtcnRj0Lkl87WwieU5wjwuu/zEhLnbOIWZrY43D4i
emu6W7c2x0SFXsziZHTZoB/ULYagtepiikXER0sG6uNFkSZglf+HSzcaIIys4QNm
WyksATvLr2xzNsnwqdwc8TLhzw/3fFrMDf1K63RTEZMF/FE+1Fx+z7NiWYXcWLhA
6eZ47norQX1xGMpRxG4fq7BCVQX1TzXhzcNmiazOxwXss/xftvDxNeXsqunfsEyQ
Ub/L/LuNJDCMSi0rWec1PzDLldZp4nsdcn64/3DX8TN1xF+v1MT7sUcuZxaE3ouV
8nH7FGo6xVOQihtzW5hJjJeOL2/fE5wWq7SUM7y6ZOGOj6PteWsU7EdKQdHKPw0G
7mmaZADWv0+/JMQ26/RKQmvN5o2+PX/Jj72ImG+AZ9cINJqSCTHkZURLUDthnCoH
td57mh7ssXTa+8h1wqevxB4H3JmLkuCBp6pRoe5z0ds07XL9yLnf4rgFnDdNXX+F
6uFhAlaUZWfjZd+Je/GppvI4s6Hs9XfSWrrPRWBJWIXb9XzTCGSmOona6EqMz8n3
cQGBkN2q4cAs+Lou4ntm+7ezOhstyEgyU+w6Bn+HgSnrAs0yVL9pTnC5mrljiKNF
egfW4sNL0c25WLRJEk3KK7MIqOBW5C+joxERNGI6WASz9R2qYH+T4dl1wldLPqnX
7fJ4EawTDx74lzsoFfNDI4CxRAhjgUSrT6owdj9+pDflDO3lTacUHJ6sFgYf9gce
iTPknhXsY31DF88iOTxia91lIxlj5rBv+AjtxmKxvx9VK8hx/IPrK1kXPe1t+taM
+NuU5z2+2mq9bdq3hco/AUazSZ/lr2G1hBb5kcvLXjJaxU7OoArHbmcMVU3cRk50
t6eNtZHPAdfFc2ymUFLAGTnMS3EPuP0s4vxHxt6mqR502STuUkwBSLzctLVETpF0
Ryy7AmhdJBe9dLpVu2QVPwr3OUdB29f2z9DkRgMagPs=
`pragma protect end_protected

`endif // `ifndef SVT_VMM_TECHNOLOGY

`endif // GUARD_SVT_SPI_VIRTUAL_SEQUENCER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Gopg7VwoQLlRumlpP4gtGOzPHTYGhbbT4yrtwhoNANzubtAtB/qJxVuTupFXU2CX
yY80cG6fYDXMhmQF3VHAKXUQv2qXgKMf0vUqjfFBBxIJug6pCQwgWMUfs7oaOqhd
Gl0DlFhZ8rZgz+kTaA7Bnk1R21+oaFl6ly0n/rQFLMg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2609      )
1FUR+F/3uaJNNyy1MeKIY2GK146SdPQtqO//PMxnGVF+zfG8+xNZJho9TztQETx/
cJKYuxI5jbDdz4l73HrXhSRFL7zwPxwZTqd/pXifjBCJfj4E6Z3I9JCvXveB4zG3
`pragma protect end_protected
