<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * League
 *
 * @ORM\Table(name="league", indexes={@ORM\Index(name="leaguecountry", columns={"_countryId"})})
 * @ORM\Entity
 */
class League
{
    /**
     * @var int
     *
     * @ORM\Column(name="leagueId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $leagueid;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    /**
     * @var string|null
     *
     * @ORM\Column(name="logoUrl", type="string", length=255, nullable=true)
     */
    private $logourl;

    /**
     * @var string
     *
     * @ORM\Column(name="website", type="string", length=255, nullable=false)
     */
    private $website;

    /**
     * @var \Country
     *
     * @ORM\ManyToOne(targetEntity="Country")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_countryId", referencedColumnName="countryId")
     * })
     */
    private $countryid;

    public function getLeagueid(): ?int
    {
        return $this->leagueid;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getLogourl(): ?string
    {
        return $this->logourl;
    }

    public function setLogourl(?string $logourl): self
    {
        $this->logourl = $logourl;

        return $this;
    }

    public function getWebsite(): ?string
    {
        return $this->website;
    }

    public function setWebsite(string $website): self
    {
        $this->website = $website;

        return $this;
    }

    public function getCountryid(): ?Country
    {
        return $this->countryid;
    }

    public function setCountryid(?Country $countryid): self
    {
        $this->countryid = $countryid;

        return $this;
    }


}
