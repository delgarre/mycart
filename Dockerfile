# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
FROM sgrio/java-oracle
MAINTAINER Delenis Garrett (antoine.garrett@dseincorporated.com)
RUN apt-get update
RUN apt-get install -y maven

CMD ["/bin/sh"]
