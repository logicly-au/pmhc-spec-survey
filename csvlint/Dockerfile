FROM ruby:2.5 as gembuilder

RUN git clone https://github.com/strategicdata/csvlint.rb.git /build
WORKDIR build

# No need to combine these to a single line while building the gem
RUN gem install activesupport -v 5.2
RUN gem build csvlint.gemspec

FROM ruby:2.5

# copy spec tables + types to /spec
COPY table/ /spec/table
COPY type/ /spec/type
ADD metadata.json /spec
COPY --from=gembuilder /build/csvlint-0.4.0.4.gem /spec/

WORKDIR /spec

# Install csvlint gem + dependencies
ENV LANG C.UTF-8
RUN gem install activesupport -v 5.2 \
    && gem install ./csvlint-0.4.0.4.gem

CMD ["csvlint", "--schema=metadata.json"]
